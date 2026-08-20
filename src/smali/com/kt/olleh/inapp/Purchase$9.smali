.class Lcom/kt/olleh/inapp/Purchase$9;
.super Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;
.source "Purchase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/kt/olleh/inapp/Purchase;->PayDialog(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/kt/olleh/inapp/Purchase;

.field private final synthetic val$mode:I


# direct methods
.method constructor <init>(Lcom/kt/olleh/inapp/Purchase;Landroid/app/Dialog;I)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/app/Dialog;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    iput p3, p0, Lcom/kt/olleh/inapp/Purchase$9;->val$mode:I

    .line 397
    invoke-direct {p0, p2}, Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;-><init>(Landroid/app/Dialog;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 401
    invoke-super {p0, p1}, Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;->onClick(Landroid/view/View;)V

    .line 403
    iget v0, p0, Lcom/kt/olleh/inapp/Purchase$9;->val$mode:I

    packed-switch v0, :pswitch_data_0

    .line 434
    :cond_0
    :goto_0
    return-void

    .line 406
    :pswitch_0
    const/16 v0, 0x3f4

    sput v0, Lcom/kt/olleh/inapp/Purchase;->Pay_Alert_Mode:I

    .line 407
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/kt/olleh/inapp/Purchase;->access$5(Lcom/kt/olleh/inapp/Purchase;I)V

    .line 408
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const-string v1, "\uc608"

    invoke-static {v0, v1}, Lcom/kt/olleh/inapp/Purchase;->access$6(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 409
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const-string v1, "\uc544\ub2c8\uc624"

    invoke-static {v0, v1}, Lcom/kt/olleh/inapp/Purchase;->access$7(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 410
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const-string v1, "\uacb0\uc81c\ub97c \uc7ac\ud655\uc778\ud569\ub2c8\ub2e4."

    invoke-static {v0, v1}, Lcom/kt/olleh/inapp/Purchase;->access$4(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 411
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/kt/olleh/inapp/Purchase;->access$8(Lcom/kt/olleh/inapp/Purchase;Z)V

    .line 412
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const/16 v1, 0x3ea

    invoke-virtual {v0, v1}, Lcom/kt/olleh/inapp/Purchase;->SendMessage(I)V

    goto :goto_0

    .line 416
    :pswitch_1
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v1}, Lcom/kt/olleh/inapp/Purchase;->access$14(Lcom/kt/olleh/inapp/Purchase;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v2}, Lcom/kt/olleh/inapp/Purchase;->access$15(Lcom/kt/olleh/inapp/Purchase;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "DP"

    const-string v4, "1111112222222"

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/kt/olleh/inapp/Purchase;->requestDIBuy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const-string v1, "\ucde8\uc18c"

    invoke-static {v0, v1}, Lcom/kt/olleh/inapp/Purchase;->access$6(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 418
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const-string v1, "\uacb0\uc81c \uc694\uccad \uc911..."

    invoke-static {v0, v1}, Lcom/kt/olleh/inapp/Purchase;->access$4(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V

    .line 419
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const/16 v1, 0x3eb

    invoke-virtual {v0, v1}, Lcom/kt/olleh/inapp/Purchase;->SendMessage(I)V

    goto :goto_0

    .line 423
    :pswitch_2
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v0}, Lcom/kt/olleh/inapp/Purchase;->access$10(Lcom/kt/olleh/inapp/Purchase;)Lcom/kt/olleh/inapp/OnInAppListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 424
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v0}, Lcom/kt/olleh/inapp/Purchase;->access$10(Lcom/kt/olleh/inapp/Purchase;)Lcom/kt/olleh/inapp/OnInAppListener;

    move-result-object v0

    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v1}, Lcom/kt/olleh/inapp/Purchase;->access$16(Lcom/kt/olleh/inapp/Purchase;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/kt/olleh/inapp/OnInAppListener;->OnResultPurchase(Ljava/lang/String;)V

    goto :goto_0

    .line 428
    :pswitch_3
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$9;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v0}, Lcom/kt/olleh/inapp/Purchase;->userCancelResponse()V

    goto :goto_0

    .line 403
    nop

    :pswitch_data_0
    .packed-switch 0x3f3
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
