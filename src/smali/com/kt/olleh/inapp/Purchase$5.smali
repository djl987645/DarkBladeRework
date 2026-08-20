.class Lcom/kt/olleh/inapp/Purchase$5;
.super Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;
.source "Purchase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/kt/olleh/inapp/Purchase;->SelectDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/kt/olleh/inapp/Purchase;


# direct methods
.method constructor <init>(Lcom/kt/olleh/inapp/Purchase;Landroid/app/Dialog;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/app/Dialog;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase$5;->this$0:Lcom/kt/olleh/inapp/Purchase;

    .line 203
    invoke-direct {p0, p2}, Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;-><init>(Landroid/app/Dialog;)V

    return-void
.end method


# virtual methods
.method public getDialog()Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 232
    invoke-super {p0}, Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 208
    invoke-super {p0, p1}, Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;->onClick(Landroid/view/View;)V

    .line 209
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 211
    .local v0, "getTagValue":Ljava/lang/String;
    const-string v1, "1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 213
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase$5;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const-string v2, "01"

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Purchase;->access$12(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 214
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase$5;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const-string v2, "\ud578\ub4dc\ud3f0 \uacb0\uc81c"

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Purchase;->access$13(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 223
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase$5;->this$0:Lcom/kt/olleh/inapp/Purchase;

    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$5;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v2}, Lcom/kt/olleh/inapp/Purchase;->access$14(Lcom/kt/olleh/inapp/Purchase;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/kt/olleh/inapp/Purchase$5;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v3}, Lcom/kt/olleh/inapp/Purchase;->access$15(Lcom/kt/olleh/inapp/Purchase;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/kt/olleh/inapp/Purchase;->getDIInformation(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase$5;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const-string v2, "\ucde8\uc18c"

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Purchase;->access$6(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 225
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase$5;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const-string v2, "\uc815\ubcf4\uc694\uccad\uc911.."

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Purchase;->access$4(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 226
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase$5;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const/16 v2, 0x3eb

    invoke-virtual {v1, v2}, Lcom/kt/olleh/inapp/Purchase;->SendMessage(I)V

    .line 227
    return-void

    .line 216
    :cond_1
    const-string v1, "2"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 218
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase$5;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const-string v2, "02"

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Purchase;->access$12(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 219
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase$5;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const-string v2, "\uc778\ud130\ub137\uc804\ud654 \uacb0\uc81c"

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Purchase;->access$13(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    goto :goto_0
.end method
