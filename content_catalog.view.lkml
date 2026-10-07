view: content_catalog {
  sql_table_name: `dynamic_union.content_catalog` ;;

  dimension: content_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.content_id ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }

  dimension: release_year {
    type: number
    sql: ${TABLE}.release_year ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  measure: count {
    type: count
    drill_fields: [content_id, title, type, brand]
  }
}