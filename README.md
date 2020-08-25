# FilmLibrary_JSON_SQL_ASP.NET_WinForms

Your objective is to build a small project named MovieData. The application will use the API
from The Movie DB (https://developers.themoviedb.org/3/getting-started), using an
API key.
The goal of this assignment is to implement an application or script that will retrieve and
store movie information.
The application must retrieve a list of the movies currently in theaters in Greece, along with
at least the following attributes
● Title
● Description
● Original Title
● List of Directors
● The IMDB link to the profile of each of the directors

From https://api.themoviedb.org/3/discover/movie?api_key=bbb0e77b94b09193e6f32d5fac7a3b9c&region=GR&release_date.gte=2020-05-01&release_date.lte=2020-12-30&with_release_type=2|3, the list of the movies that there are in greek theaters this period will be retrieved and I will use it in order to update Movie Table. I assumed that the relationship between movies and directors is many to many for that reason I used intermediate table MovieDirector.

I created an ASP.NET Web Application(.NET Framework) Web Forms Database First project.
The database was connected with Asp.Net project implementing ADO.NET Entity Data Model


