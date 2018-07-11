view: quiz_events {

  dimension: user_id {
    type: string
    sql: ${TABLE}.userId ;;
  }

  dimension_group: page_created {
    type: time
    timeframes: [time, date, week, month, day_of_week, hour_of_day, minute]
    sql: TIMESTAMP_MILLIS(${TABLE}.pageCreatedDate) ;;
  }

  dimension: is_answer_correct {
    type: yesno
    sql: ${TABLE}.isAnswerCorrect ;;
  }

  dimension: question_id {
    type: number
    sql: ${TABLE}.questionId ;;
  }

  dimension_group: answer_submitted {
    type: time
    timeframes: [time, date, week, month, day_of_week, hour_of_day, minute]
    sql: TIMESTAMP_MILLIS(${TABLE}.answerSubmitDate) ;;
  }

  dimension: answer_submitted_timestamp {
    type: number
    sql: ${TABLE}.answerSubmitDate ;;
  }

  dimension: answer {
    type: string
    sql: ${TABLE}.answer ;;
  }

  dimension: question {
    hidden: yes
    sql: ${TABLE}.question ;;
  }

  dimension: seconds_to_answer {
    type:  number
    sql:  (${TABLE}.answerSubmitDate - ${TABLE}.pageCreatedDate) / 1000 ;;
    value_format: "0"
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_percent {
    type: percent_of_total
    sql: ${count} ;;
  }

  measure: user_count {
    type:  count_distinct
    sql:  ${TABLE}.userId ;;
  }

  measure: question_count {
    type: number
    sql:  COUNT(DISTINCT ${TABLE}.questionId) ;;
  }
}

view: question {
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: question_id {
    type: number
    sql: ${TABLE}.questionId ;;
  }

  dimension: question {
    type: string
    sql: ${TABLE}.question ;;
  }

  dimension: difficulty {
    type: number
    sql: ${TABLE}.difficulty ;;
  }

  dimension_group: date_added {
    type: time
    timeframes: [time, date, week, month, day_of_week, hour_of_day, minute]
    sql: TIMESTAMP_MILLIS(${TABLE}.dateAdded) ;;
  }

  dimension: choices {
    type: string
    sql: question_choices ;;
  }
}
