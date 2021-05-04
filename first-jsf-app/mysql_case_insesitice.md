# How to make My SQL case insensitive

First of all make a backup of your database with the command
```bash
mysqldump -u [user] -p [database_1] [database_2] [database_etc] > [filename].sql
```

After that stop the server
```bash
systemctl stop mysql
```

Recreate the data folder. Just remove is not enought
```bash
sudo rm -rf /var/lib/mysql
sudo mkdir /var/lib/mysql    
sudo chown mysql:mysql /var/lib/mysql
sudo chmod 700 /var/lib/mysql
```

Add `lower_case_table_names = 1` to the `[mysqld]` section in `/etc/mysql/mysql.conf.d/mysqld.cnf`

Reinitialize MySQL with command
```bash
sudo mysqld --defaults-file=/etc/mysql/my.cnf --initialize --lower_case_table_names=1 --user=mysql --console
```

Start MySQL server
```bash
sudo service mysql start
```

Retrive the temp root password
```bash
sudo grep 'temporary password' /var/log/mysql/error.log
```

Connect to MySQL and change the password with command
```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPa$$w0rd';
```

Optionaly run the command
```bash
sudo mysql_secure_installation
```

Restore database
```bash
mysql -u [user] -p [database_name] < [filename].sql
```

To view MySQL error logs
```bash
 /var/log/mysql/error.log
```

In case of unresolvable fault of MySQL you can reinstall it 
```bash
sudo apt purge mysql-server mysql-client mysql-common
sudo apt autoremove
sudo rm -rf /var/lib/mysql*

sudo apt install mysql-server
```

Some links 
* https://stackoverflow.com/questions/53103588/lower-case-table-names-1-on-ubuntu-18-04-doesnt-let-mysql-to-start
* https://askubuntu.com/questions/265685/how-to-reinstall-mysql
* https://www.cyberciti.biz/faq/mysql-change-user-password/
* https://phoenixnap.com/kb/how-to-backup-restore-a-mysql-database
