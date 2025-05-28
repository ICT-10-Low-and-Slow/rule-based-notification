# import time
# import json
# import yaml
# import logging
# import pyodbc
# from core.rule_engine import RuleEngine
# from config import Settings

# logging.basicConfig(level=logging.INFO)

# RULES_FILE = "notification.yaml"

# def load_rules():
#     with open(RULES_FILE, 'r', encoding='utf-8') as file:
#         rules = yaml.safe_load(file)
#     return rules.get("rules", [])

# class EventListener:
#     def __init__(self, poll_interval=2):
#         self.poll_interval = poll_interval
#         self.rules = load_rules()
#         self.rule_engine = RuleEngine(self.rules)

#     def fetch_unprocessed_events(self, cursor):
#         cursor.execute("""
#             SELECT EventID, TableName, EventType, RecordID, EventData 
#             FROM dbo.EventQueue 
#             WHERE Processed = 0 
#             ORDER BY EventID
#         """)
#         return cursor.fetchall()

#     def mark_event_processed(self, cursor, event_id):
#         cursor.execute("UPDATE dbo.EventQueue SET Processed = 1 WHERE EventID = ?", (event_id,))

#     def process_events(self):
#         with pyodbc.connect(Settings.DB_URL) as conn:
#             cursor = conn.cursor()

#             while True:
#                 try:
#                     events = self.fetch_unprocessed_events(cursor)

#                     for event in events:
#                         event_id, table_name, event_type, record_id, event_data = event
#                         event_dict = {
#                             "EventID": event_id,
#                             "TableName": table_name,
#                             "EventType": event_type,
#                             "RecordID": record_id,
#                             "EventData": json.loads(event_data or "{}")
#                         }

#                         logging.info(f"Processing event {event_id} from table {table_name}")
#                         self.rule_engine.evaluate(event_dict)
#                         self.mark_event_processed(cursor, event_id)

#                     conn.commit()
#                     time.sleep(self.poll_interval)

#                 except Exception as e:
#                     logging.error(f"Error processing events: {str(e)}")
#                     time.sleep(self.poll_interval)

# if __name__ == "__main__":
#     listener = EventListener()
#     listener.process_events()
