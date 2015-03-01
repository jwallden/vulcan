using Soup;

namespace Vulcan{

	public class Pastebin{
			
		private string api_dev_key;
		private string api_paste_code;
		private string url;
		private string content;
		
		
		public Pastebin(){
			api_dev_key = "0e43c0f604dfe1f796b1256368c5c47a";
			api_paste_code = "Testing from Vulcan";
			url = "http://pastebin.com/api/api_post.php";
			content = "api_option=paste&api_dev_key=%s&api_paste_code=%s".printf(api_dev_key, api_paste_code);
			
			var session = new Soup.Session();
			var message = new Soup.Message("POST", url);
			
			message.set_request("application/x-www-form-urlencoded", MemoryUse.COPY, content.data);
			
			session.send_message(message);
			
			stdout.write(message.response_body.data);
			stdout.printf("\n");
		}	
	}
}
