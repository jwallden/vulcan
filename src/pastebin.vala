using Soup;

namespace Vulcan{

	public class Pastebin{
			
		private string api_dev_key;
		private string api_paste_code;
		private string url;
		private string content;
				
		public Pastebin(){
			//Would be nice to access api_dev_key from Consts.
			//Check how to do that.
			this.api_dev_key = "0e43c0f604dfe1f796b1256368c5c47a";
			this.url = "http://pastebin.com/api/api_post.php";
			
		}
			
		public string paste(string paste_data){
			this.api_paste_code = paste_data;
			this.content = "api_option=paste&api_dev_key=%s&api_paste_code=%s"
						   .printf(this.api_dev_key, this.api_paste_code);
			var session = new Soup.Session();
			var message = new Soup.Message("POST", url);
			
			message.set_request("application/x-www-form-urlencoded", MemoryUse.COPY, content.data);
			session.send_message(message);
			
			return((string)message.response_body.data);
		}	
	}
	
	//For testing purposes
	void main(){
		var pb = new Pastebin();
		stdout.printf(pb.paste("Pasting from object method") + "\n");
		}
}
