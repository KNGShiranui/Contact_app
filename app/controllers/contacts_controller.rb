class ContactsController < ApplicationController
  
  
  def new
    @contact = Contact.new  
  end
  
  def create
    @contact = Contact.new(contact_params)    # 上記のプログラムをさらに修正してmodelからのバリデーション適用
    if @contact.save
      redirect_to new_contact_path, notice: "質問を保存しました！"
    else
      render :new
    end
  end


private
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end