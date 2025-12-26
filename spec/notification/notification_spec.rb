require_relative "../spec_helper"

RSpec.describe "EduardoKirk notification" do
  context "" do
    it "outputs nothing to stdout and stderr" do
      stdin_data = {
        session_id: "00000000-0000-0000-0000-000000000000",
        transcript_path: Pathname.new(__dir__).join("./transcript_file.jsonl").to_s,
        cwd: Pathname.getwd.to_s,
        hook_event_name: "Notification",
        message: "hello world",
        notification_type: "permission_prompt"
      }

      stdout, stderr, status = Open3.capture3(ENV["EDUARDO_KIRK_PATH"], "notification", stdin_data: stdin_data.to_json)
      expect(stdout).to be_empty
      expect(stderr).to be_empty
    end
  end
end
