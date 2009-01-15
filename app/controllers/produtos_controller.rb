class ProdutosController < ApplicationController
  # GET /produtos
  # GET /produtos.xml
  
  require 'htmldoc'
  
  def index
    @produtos = Produto.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @produtos }
      format.pdf { send_data render_to_pdf({:action => 'index'}) , :filename => "blablabla.pdf", :type => 'application/pdf', :disposition => 'inline' } 
    end
  end

  def render_to_pdf(options = nil)
    data = render_to_string(options)
    pdf = PDF::HTMLDoc.new
    # para ver quais as opcoes disponiveis, consulte a documentacao
    # do HTMLdoc
    pdf.set_option :bodycolor, :white
    pdf.set_option :toc, false
    pdf.set_option :portrait, true
    pdf.set_option :links, false
    pdf.set_option :webpage, true    
    pdf.set_option :left, '1cm'
    pdf.set_option :right, '1cm'
    pdf << data
    pdf.generate
  end

  # GET /produtos/1
  # GET /produtos/1.xml
  def show
    @produto = Produto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @produto }
    end
  end

  # GET /produtos/new
  # GET /produtos/new.xml
  def new
    @produto = Produto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @produto }
    end
  end

  # GET /produtos/1/edit
  def edit
    @produto = Produto.find(params[:id])
  end

  # POST /produtos
  # POST /produtos.xml
  def create
    @produto = Produto.new(params[:produto])

    respond_to do |format|
      if @produto.save
        flash[:notice] = 'Produto was successfully created.'
        format.html { redirect_to(@produto) }
        format.xml  { render :xml => @produto, :status => :created, :location => @produto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @produto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /produtos/1
  # PUT /produtos/1.xml
  def update
    @produto = Produto.find(params[:id])

    respond_to do |format|
      if @produto.update_attributes(params[:produto])
        flash[:notice] = 'Produto was successfully updated.'
        format.html { redirect_to(@produto) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @produto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.xml
  def destroy
    @produto = Produto.find(params[:id])
    @produto.destroy

    respond_to do |format|
      format.html { redirect_to(produtos_url) }
      format.xml  { head :ok }
    end
  end
end
