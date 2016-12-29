require "spec_helper"

describe AttrCleaner::Model do
  let(:model) do
    JamJar.model do
      column :title, :string
      column :body, :text
    end
  end

  let(:instance) { model.new }

  describe ".attr_cleaner" do
    context "called with attributes" do
      before { model.attr_cleaner :title, :body }

      specify { expect(model.attr_cleaners).to eq [:title, :body] }
    end
  end

  describe "#write_attribute_with_cleaner" do
    context "with no cleaners" do
      context "a padding string is assigned" do
        before { instance.title = " Padded Title " }

        specify { expect(instance.title).to eq " Padded Title " }
      end

      context "an empy string is assigned" do
        before { instance.title = "  " }

        specify { expect(instance.title).to eq "  " }
      end
    end

    context "with cleaners" do
      before { model.attr_cleaner :title }

      context "a padding string is assigned" do
        before { instance.title = " Padded Title " }

        specify { expect(instance.title).to eq "Padded Title" }
      end

      context "an empy string is assigned" do
        before { instance.title = "  " }

        specify { expect(instance.title).to be_nil }
      end
    end
  end
end
