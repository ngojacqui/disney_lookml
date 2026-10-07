connection: "jacqui_lags_pbl"

include: "*.view.lkml"
include: "*.dashboard.lookml"

explore: viewing_sessions {
  label: "Disney Streaming Sessions"
  description: "Explore viewing sessions, subscriber data, and content catalog."

  join: subscribers {
    type: left_outer
    sql_on: ${viewing_sessions.subscriber_id} = ${subscribers.subscriber_id} ;;
    relationship: many_to_one
  }

  join: content_catalog {
    type: left_outer
    sql_on: ${viewing_sessions.content_id} = ${content_catalog.content_id} ;;
    relationship: many_to_one
  }
}

explore: subscribers {
  label: "Disney Subscribers"
  description: "Explore subscriber growth, tiers, and demographics."
}