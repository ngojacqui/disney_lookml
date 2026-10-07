view: viewing_sessions {
  sql_table_name: `dynamic_union.viewing_sessions` ;;

  dimension: session_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: subscriber_id {
    type: string
    hidden: yes
    sql: ${TABLE}.subscriber_id ;;
  }

  dimension: content_id {
    type: string
    hidden: yes
    sql: ${TABLE}.content_id ;;
  }

  dimension_group: session_start {
    type: time
    timeframes: [raw, time, date, week, month, year]
    sql: ${TABLE}.session_start_at ;;
  }

  dimension: duration_minutes {
    type: number
    sql: ${TABLE}.duration_minutes ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  measure: count {
    type: count
    drill_fields: [session_id, device_type, session_start_time]
  }

  measure: total_duration_minutes {
    type: sum
    sql: ${duration_minutes} ;;
  }

  measure: average_duration_minutes {
    type: average
    sql: ${duration_minutes} ;;
    value_format_name: decimal_2
  }
}