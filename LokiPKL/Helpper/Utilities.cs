using System;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace LokiPKL.Helpper
{
    public class Utilities
    {
        public static void CreateIfMissing(string path)
        {
            bool folderExists = Directory.Exists(path);
            if (folderExists)
            {
                Directory.CreateDirectory(path);
            }
        }
        public static async Task<string> UploadFile(Microsoft.AspNetCore.Http.IFormFile file,string sDirectory, string newname)
        {
            try
            {
                if (newname == null) newname = file.FileName;
                string path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Upload",sDirectory);
                CreateIfMissing(path);
                string pathFile = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Upload", sDirectory, newname);
                var supportedTypes = new[] {"jpg", "jpeg", "png", "gif"};
                var fileExt = System.IO.Path.GetExtension(file.FileName).Substring(1);
                if (!supportedTypes.Contains(fileExt.ToLower()))
                {
                    return null;
                }
                else
                {
                    using(var stream = new FileStream(pathFile, FileMode.Create))
                    {
                        await file.CopyToAsync(stream);
                    }
                    return newname;
                }
            }
            catch(Exception ex)
            {
                return null;
            }
        }
    }
}
