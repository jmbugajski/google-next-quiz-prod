explore: next_image {
  hidden: yes
}

view: next_image {
  derived_table: {
    sql: select 1 as dummy
      ;;
  }


  dimension: dummy {
    type: number
    sql: ${TABLE}.dummy ;;
  }

  dimension: looker_image {
    type: string
    sql: ${TABLE}.dummy;;
    html: <img src="https://lh3.googleusercontent.com/-UsdC0SphpuA/W1IRbYkJTcI/AAAAAAAAc7w/64nU8Hkt7QwKL963_OpOPvw7OMOdcMGzACLcBGAs/w512-h288-p/10%2Bmust-see%2BG%2BSuite%2Bdeveloper%2Bsessions%2Bat%2BGoogle%2BCloud%2BNext%2B%252718" /> ;;
  }
}
