CD D:\home\site\wwwroot

IF NOT EXIST D:\home\site\wwwroot\content\data\ghost-dev.db (
    ECHO development db file missing. Creating
    SET NODE_ENV=development
    node .\node_modules\knex-migrator\bin\knex-migrator-init
) ELSE (
    ECHO development db file exists. Skipping
)

IF NOT EXIST D:\home\site\wwwroot\content\data\ghost.db (
    ECHO production db file missing. Creating
    SET NODE_ENV=production
    node .\node_modules\knex-migrator\bin\knex-migrator-init
) ELSE (
    ECHO production db file exists. Skipping   
)