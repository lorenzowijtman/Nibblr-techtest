# Laravel todo API

## Work done
For this assignment I've done the main tasks described in the assignment. I did not have enough time to 
do the extra's as well because I'm in the middle of my finals. However, I will get back to the authentication and 
learning more about best practices in Laravel at the end of the month as it's a framework I've been wanting 
to learn more about. Before starting this assignment I had to prior knowledge about Laravel or php, I would say it has 
not been very difficult to get started and learn some of the basic due to the good documentation of Laravel and some
of the hints provided in the assignment pdf, thank you for that by the way!

## Specifics
I've used a MySql database for saving the data and Postman for testing the API calls. These two tools were an easy pick
as they are my go-to tools for SQL databases and API testing.

For returning the correct status codes from API calls I've used Eloquent functions such as findOrFail. I have also
added a custom 404 return body for when a 404 is returned. The code for this can be found in 
app > Exceptions > Handler.php. 

I'm assuming parts of the application can be stripped when using a Laravel application only as backend, but
I didn't strip any code or folders because I did not have time to look into this.

For filling the database with some sample data I've also created a class called TodosTableSeeder which can be found in
app > database > seeders. to fill the database with some sample data, simply run the following command
```php artisan db:seed --class=TodosTableSeeder```  
Sometimes it will throw an error because the generated description is too long. However, 
since it's a dev functionality, and it doesn't happen all the time, I didn't make any changes for it. It is 
something I'm aware of though.

That's it for my explanation of the assignment, please do provide me with some feedback where applicable because 
I'm always looking for improvements especially when learning a new language and framework!

