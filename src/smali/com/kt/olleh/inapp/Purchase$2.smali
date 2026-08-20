.class Lcom/kt/olleh/inapp/Purchase$2;
.super Ljava/lang/Object;
.source "Purchase.java"

# interfaces
.implements Lcom/kt/olleh/inapp/OnInAppListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/kt/olleh/inapp/Purchase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/kt/olleh/inapp/Purchase;


# direct methods
.method constructor <init>(Lcom/kt/olleh/inapp/Purchase;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    .line 766
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "errorCode"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 823
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v0}, Lcom/kt/olleh/inapp/Purchase;->access$0(Lcom/kt/olleh/inapp/Purchase;)Lcom/kt/olleh/inapp/dialog/DialogProgress;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 824
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const/16 v1, 0x3ec

    invoke-virtual {v0, v1}, Lcom/kt/olleh/inapp/Purchase;->SendMessage(I)V

    .line 829
    :cond_0
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v0}, Lcom/kt/olleh/inapp/Purchase;->access$10(Lcom/kt/olleh/inapp/Purchase;)Lcom/kt/olleh/inapp/OnInAppListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 830
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v0}, Lcom/kt/olleh/inapp/Purchase;->access$10(Lcom/kt/olleh/inapp/Purchase;)Lcom/kt/olleh/inapp/OnInAppListener;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/kt/olleh/inapp/OnInAppListener;->OnError(Ljava/lang/String;Ljava/lang/String;)V

    .line 831
    :cond_1
    return-void
.end method

.method public OnResultAPI(Ljava/lang/String;Lcom/kt/olleh/inapp/net/Response;)V
    .locals 6
    .param p1, "api"    # Ljava/lang/String;
    .param p2, "data"    # Lcom/kt/olleh/inapp/net/Response;

    .prologue
    const/16 v5, 0x3ea

    const/4 v4, 0x1

    .line 775
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v2}, Lcom/kt/olleh/inapp/Purchase;->access$0(Lcom/kt/olleh/inapp/Purchase;)Lcom/kt/olleh/inapp/dialog/DialogProgress;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 776
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const/16 v3, 0x3ec

    invoke-virtual {v2, v3}, Lcom/kt/olleh/inapp/Purchase;->SendMessage(I)V

    .line 778
    :cond_0
    const-string v2, "getDiDetail"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    move-object v1, p2

    .line 780
    check-cast v1, Lcom/kt/olleh/inapp/net/ResDIDetail;

    .line 782
    .local v1, "res":Lcom/kt/olleh/inapp/net/ResDIDetail;
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v1}, Lcom/kt/olleh/inapp/net/ResDIDetail;->getPrice()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v2, v3}, Lcom/kt/olleh/inapp/Purchase;->access$2(Lcom/kt/olleh/inapp/Purchase;I)V

    .line 783
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v1}, Lcom/kt/olleh/inapp/net/ResDIDetail;->getDiTitle()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/kt/olleh/inapp/Purchase;->access$3(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 784
    const-string v0, "\ud574\ub2f9 \uc544\uc774\ud15c\uc744 \uad6c\ub9e4\ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c?"

    .line 785
    .local v0, "msg":Ljava/lang/String;
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v2, v0}, Lcom/kt/olleh/inapp/Purchase;->access$4(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 787
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const/4 v3, 0x2

    invoke-static {v2, v3}, Lcom/kt/olleh/inapp/Purchase;->access$5(Lcom/kt/olleh/inapp/Purchase;I)V

    .line 788
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const-string v3, "\uc608"

    invoke-static {v2, v3}, Lcom/kt/olleh/inapp/Purchase;->access$6(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 789
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const-string v3, "\uc544\ub2c8\uc624"

    invoke-static {v2, v3}, Lcom/kt/olleh/inapp/Purchase;->access$7(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 790
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v2, v4}, Lcom/kt/olleh/inapp/Purchase;->access$8(Lcom/kt/olleh/inapp/Purchase;Z)V

    .line 791
    const/16 v2, 0x3f3

    sput v2, Lcom/kt/olleh/inapp/Purchase;->Pay_Alert_Mode:I

    .line 793
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v2, v5}, Lcom/kt/olleh/inapp/Purchase;->SendMessage(I)V

    .line 819
    .end local v0    # "msg":Ljava/lang/String;
    .end local v1    # "res":Lcom/kt/olleh/inapp/net/ResDIDetail;
    :cond_1
    :goto_0
    return-void

    .line 795
    :cond_2
    const-string v2, "buyDi"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    move-object v1, p2

    .line 797
    check-cast v1, Lcom/kt/olleh/inapp/net/ResDIBuy;

    .line 799
    .local v1, "res":Lcom/kt/olleh/inapp/net/ResDIBuy;
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    iget-object v3, v1, Lcom/kt/olleh/inapp/net/ResDIBuy;->mTr_id:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/kt/olleh/inapp/Purchase;->access$9(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 801
    const/16 v2, 0x3f5

    sput v2, Lcom/kt/olleh/inapp/Purchase;->Pay_Alert_Mode:I

    .line 802
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v2, v4}, Lcom/kt/olleh/inapp/Purchase;->access$5(Lcom/kt/olleh/inapp/Purchase;I)V

    .line 803
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const-string v3, "\ud655\uc778"

    invoke-static {v2, v3}, Lcom/kt/olleh/inapp/Purchase;->access$6(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 804
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const-string v3, "\uacb0\uc81c\uac00 \uc644\ub8cc\ub418\uc5c8\uc2b5\ub2c8\ub2e4."

    invoke-static {v2, v3}, Lcom/kt/olleh/inapp/Purchase;->access$4(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 805
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/kt/olleh/inapp/Purchase;->access$8(Lcom/kt/olleh/inapp/Purchase;Z)V

    .line 807
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v2, v5}, Lcom/kt/olleh/inapp/Purchase;->SendMessage(I)V

    goto :goto_0

    .line 809
    .end local v1    # "res":Lcom/kt/olleh/inapp/net/ResDIBuy;
    :cond_3
    const-string v2, "checkShowId"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    move-object v1, p2

    .line 811
    check-cast v1, Lcom/kt/olleh/inapp/net/ResCheckShowId;

    .line 817
    .local v1, "res":Lcom/kt/olleh/inapp/net/ResCheckShowId;
    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v2}, Lcom/kt/olleh/inapp/Purchase;->purchaseGetInfo()V

    goto :goto_0
.end method

.method public OnResultFileURL(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 843
    return-void
.end method

.method public OnResultOLDAPI(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 835
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v0}, Lcom/kt/olleh/inapp/Purchase;->access$10(Lcom/kt/olleh/inapp/Purchase;)Lcom/kt/olleh/inapp/OnInAppListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 836
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$2;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v0}, Lcom/kt/olleh/inapp/Purchase;->access$10(Lcom/kt/olleh/inapp/Purchase;)Lcom/kt/olleh/inapp/OnInAppListener;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/kt/olleh/inapp/OnInAppListener;->OnResultOLDAPI(Ljava/lang/String;Ljava/lang/String;)V

    .line 837
    :cond_0
    return-void
.end method

.method public OnResultPurchase(Ljava/lang/String;)V
    .locals 0
    .param p1, "tr_id"    # Ljava/lang/String;

    .prologue
    .line 770
    return-void
.end method
