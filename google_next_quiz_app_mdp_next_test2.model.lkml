connection: "mdp-next18-raw-events"
include: "*.view"

datagroup: google_next_quiz_app_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 minute"
}

persist_with: google_next_quiz_app_default_datagroup

explore: quiz_events {
  sql_table_name: `mdp-next-test.raw.events` ;;
  # Repeated nested Object
  join: question {
    view_label:  "Quiz Events: Questions"
    sql:  LEFT JOIN UNNEST(quiz_events.question.choices) as question_choices ;;
    relationship:  many_to_one
  }
}
