require_relative '../lib/task'

describe Task do

  context "Task#new" do
    context "When task already includes pomodori" do
      subject { Task.new(1, "Write Task spec (#pomo: 3/5)")}
      specify { expect(subject.pomodori).to eq(3) }
      specify { expect(subject.planned).to eq(5) }
      specify { expect(subject.text).to eq("Write Task spec") }
      specify { expect(subject.to_s).to eq("Write Task spec (#pomo: 3/5)") }
    end

    context "When task does not include pomodori" do
      subject { Task.new(1, "Write Task spec")}
      specify { expect(subject.pomodori).to eq(0) }
      specify { expect(subject.planned).to eq(0) }
      specify { expect(subject.text).to eq("Write Task spec") }
      specify { expect(subject.to_s).to eq("Write Task spec (#pomo: 0/0)") }
    end
  end

  context "Task#add_pomo" do
    context "Prioritized task" do
      subject { Task.new(1, "(A) Write Task spec (#pomo: 3/5)")}
      specify { expect(subject.pomodori).to eq(3) }

      context "Adding pomo to a tagged task" do
        before { subject.add_pomo }
        specify { expect(subject.pomodori).to eq(4) }
        specify { expect(subject.to_s).to eq("Write Task spec (#pomo: 4/5)") }
        specify { subject.add_pomo; expect(subject.to_s).to eq("Write Task spec (#pomo: 5/5)") }
      end
    end

    context "Already tagged task" do
      subject { Task.new(1, "Write Task spec (#pomo: 3/5)")}
      specify { expect(subject.pomodori).to eq(3) }

      context "Adding pomo to a tagged task" do
        before { subject.add_pomo }
        specify { expect(subject.pomodori).to eq(4) }
        specify { expect(subject.to_s).to eq("Write Task spec (#pomo: 4/5)") }
      end
    end

    context "Normal task" do
      subject { Task.new(1, "Write Task spec")}
      specify { expect(subject.pomodori).to eq(0) }

      context "Adding pomo to a normal task" do
        before { subject.add_pomo }
        specify { expect(subject.pomodori).to eq(1) }
        specify { expect(subject.to_s).to eq("Write Task spec (#pomo: 1/0)") }
      end
    end
  end

  context "Task#plan" do
    context "When task already includes pomodori" do
      subject { Task.new(1, "Write Task spec (#pomo: 3/5)")}
      before { subject.plan(10) }
      specify { expect(subject.pomodori).to eq(3) }
      specify { expect(subject.planned).to eq(10) }
      specify { expect(subject.text).to eq("Write Task spec") }
      specify { expect(subject.to_s).to eq("Write Task spec (#pomo: 3/10)") }
    end

    context "When task does not include pomodori" do
      subject { Task.new(1, "Write Task spec")}
      before { subject.plan(10) }
      specify { expect(subject.pomodori).to eq(0) }
      specify { expect(subject.planned).to eq(10) }
      specify { expect(subject.text).to eq("Write Task spec") }
      specify { expect(subject.to_s).to eq("Write Task spec (#pomo: 0/10)") }
    end
  end

  context "Task#status" do
    subject { Task.new(1, "Write Task spec")}

    context "new task" do
      specify { expect(subject.status).to eq :new }
    end

    context "planned task" do
      before  { subject.plan(10) }
      specify { expect(subject.status).to eq :planned }
    end

    context "in progress task" do
      before  { subject.plan(10); subject.add_pomo }
      specify { expect(subject.status).to eq :in_progress }
    end

    context "completed task" do
      before  { subject.plan(1); subject.add_pomo }
      specify { expect(subject.status).to eq :completed }
    end

    context "underestimated task" do
      before  { subject.plan(1); 2.times { subject.add_pomo } }
      specify { expect(subject.status).to eq :underestimated }
    end
  end
end

