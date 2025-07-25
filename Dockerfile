name: eg4
category: energy
description: Model Context Protocol server for EG4 solar inverter monitoring and control
repository: https://github.com/matt-dreyer/EG4_MCP_server
author: Matt Dreyer
license: MIT

config:
  description: Configure the connection to EG4 monitoring system
  env:
    - name: EG4_USERNAME
      example: your_eg4_username
      value: '{{eg4.username}}'
    - name: EG4_PASSWORD
      example: your_eg4_password  
      value: '{{eg4.password}}'
    - name: EG4_BASE_URL
      example: https://monitor.eg4electronics.com
      value: '{{eg4.base_url}}'
    - name: EG4_DISABLE_VERIFY_SSL
      example: "0"
      value: '{{eg4.disable_verify_ssl}}'
  
  parameters:
    type: object
    properties:
      username:
        type: string
        description: EG4 monitoring portal username
      password:
        type: string
        description: EG4 monitoring portal password  
      base_url:
        type: string
        description: EG4 monitoring base URL
        default: https://monitor.eg4electronics.com
      disable_verify_ssl:
        type: string
        description: Disable SSL verification (0 or 1)
        default: "0"
    required:
      - username
      - password

tools:
  - name: Fetch_Configuration
    description: Get complete system configuration and status
  - name: Get_System_Details  
    description: Detailed system information and inverter specs
  - name: Get_Current_Production
    description: Real-time production and consumption data
  - name: Get_Performance_Analysis
    description: Performance metrics and efficiency analysis
  - name: Get_Historical_Data
    description: Historical energy data and trends
  - name: Get_System_Alerts
    description: System health alerts and warnings
  - name: Get_System_Health
    description: Comprehensive health scoring
  - name: Get_Maintenance_Insights
    description: Maintenance recommendations and scheduling