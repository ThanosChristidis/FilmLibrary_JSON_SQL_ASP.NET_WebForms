using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieData
{
    public partial class WebForm1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MovieDataEntities db = new MovieDataEntities();

            GridView1.DataSource = (from movie in db.movie
                                    from director in movie.director
                                    select new
                                    {
                                        PhotoMovie = movie.poster_path,
                                        MovieTitle = movie.title,
                                        MovieOriginalTitle = movie.original_title,
                                        MovieDescription = movie.overview,
                                        DirectorName = director.name,
                                        DirectorProfile = director.imdb_link
                                    }).ToList();


            GridView1.DataBind();
        }
    }
}