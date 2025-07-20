terraform { 
  cloud { 
    
    organization = "DevOps-project7" 

    workspaces { 
      name = "cli_driven_test" 
    } 
  } 
}