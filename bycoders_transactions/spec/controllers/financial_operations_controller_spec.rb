require 'rails_helper'

RSpec.describe FinancialOperationsController, type: :controller do
  let!(:financial_operation) { create(:financial_operation) }

  describe 'GET #index' do
    before do
      get :index
    end

    it 'returns financial operations' do
      expect(assigns(:financial_operations)).to contain_exactly(financial_operation)
    end
  end

  describe 'POST #import' do
    let(:file) do
      fixture_file_upload(File.open("#{Rails.root.join('tmp')}/CNAB.txt"), 'text/xml')
    end

    context 'with success' do
      subject { post :import, params: { file: file } }

      it 'redirects to financial operations path' do
        expect(subject).to redirect_to(financial_operations_path)
        expect(flash[:notice]).to be_present
      end
    end

    context 'with failure' do
      before do
        post :import, params: { file: nil }
      end

      it 'flash error' do
        expect(flash[:error]).to be_present
      end
    end
  end
end
