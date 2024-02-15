Welcome to Keboola dbt workshop project!

## :white_check_mark: Prerequisites:  
This workshop assumes that you are familiar with the Keboola platform. You would need the following. 
1. Have your Keboola project ready with dbt enabled.
2. Install locally [Keboola CLI](https://developers.keboola.com/cli/installation/)
3. dbt installed locally [dbt docs](https://docs.getdbt.com/docs/get-started/installation)
4. A git repo with dbt project [use this repository](https://bitbucket.org/kds_consulting_team/keboola_dbt_empower)


## dbt in Keboola CLI :
1. Open terminal in editor of your choice 
2. To check your kbc version out run: `kbc --version`
3. Run `kbc dbt init` .This should provide you necessary local setup. You will be asked to provide:
   - Project URL (Most likely *https://connection.north-europe.azure.keboola.com/*)
   - [Storage token](https://help.keboola.com/management/project/tokens/#refreshing-token)
   - Git repo, please see further
4. When you are prompted to provide repository, please use the current one, i.e. either [this repository](https://bitbucket.org/kds_consulting_team/keboola_dbt_empower) or your own if you cloned this repo.
5. Make sure you have your datasets ready in Keboola. Workshop participants should have Data Catalog shared, just [plug it in](https://help.keboola.com/catalog/#link-a-bucket). Please note we are using those two sources of the data:
   - https://www.kaggle.com/datasets/olistbr/marketing-funnel-olist
   - https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
6. Once the workspace is created, make sure to store connection strings as environmental variables.
7. Try to run dbt debug locally by executiong this command: `dbt debug -t keboola_dbt_olist --profiles-dir .`
8. If all goes well, execute run command against Keboola storage: `dbt run -t keboola_dbt_olist --profiles-dir .`
9. Good job, we will now additionally explore documentation & tests.


### Resources:
- Check how to start in [Keboola dbt documentation](https://help.keboola.com/transformations/dbt/)
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
