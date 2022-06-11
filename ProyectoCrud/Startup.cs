using Conexion;
using ILogica;
using Logica;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoCrud
{
    public class Startup
    {
        private readonly string MyApi = "MyApi";
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            #region Conexion
            Base.ConnectionString = Configuration.GetConnectionString("ConnectionString");
            services.AddScoped<IUsuario, UsuarioGes>();
            services.AddScoped<IProducto, ProductoGes>();
            services.AddScoped<ICompra, CompraGes>();
            #endregion
            services.AddControllers();
            services.AddCors(O => { O.AddPolicy(MyApi, builder => { builder.AllowAnyHeader().AllowAnyMethod().AllowAnyOrigin(); }); });


           // AddSwagger(services);
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "ProyectoCrud", Version = "v1" });
            });

        }
        private void AddSwagger(IServiceCollection services)
        {
            services.AddSwaggerGen(options =>
            {
                var groupName = "v1";

                options.SwaggerDoc(groupName, new OpenApiInfo
                {
                    Title = $"ProyectoCrud {groupName}",
                    Version = groupName,
                    Description = "ProyectoCrud API",
                    Contact = new OpenApiContact
                    {
                        Name = "ProyectoCrud Company",
                        Email = string.Empty,
                        //Url = new Uri("https://foo.com/"),
                    }
                });
            });
        }
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {

                 if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
   app.UseSwagger();
            app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "ProyectoCrud v1"));
    
            }

            app.UseHttpsRedirection();
            app.UseCors(MyApi);
            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
