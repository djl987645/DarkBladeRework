.class Lcom/kt/olleh/inapp/Purchase$11;
.super Ljava/lang/Object;
.source "Purchase.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


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
.method constructor <init>(Lcom/kt/olleh/inapp/Purchase;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase$11;->this$0:Lcom/kt/olleh/inapp/Purchase;

    iput p2, p0, Lcom/kt/olleh/inapp/Purchase$11;->val$mode:I

    .line 452
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 457
    iget v1, p0, Lcom/kt/olleh/inapp/Purchase$11;->val$mode:I

    packed-switch v1, :pswitch_data_0

    .line 472
    :cond_0
    :goto_0
    return-void

    .line 461
    :pswitch_0
    const-string v0, "\uacb0\uc81c\ub97c \ud558\uc9c0 \uc54a\uc73c\uc168\uc2b5\ub2c8\ub2e4."

    .line 462
    .local v0, "msg":Ljava/lang/String;
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase$11;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v1, v0}, Lcom/kt/olleh/inapp/Purchase;->purchaseErrorDialog(Ljava/lang/String;)V

    goto :goto_0

    .line 465
    .end local v0    # "msg":Ljava/lang/String;
    :pswitch_1
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase$11;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v1}, Lcom/kt/olleh/inapp/Purchase;->access$10(Lcom/kt/olleh/inapp/Purchase;)Lcom/kt/olleh/inapp/OnInAppListener;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 466
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase$11;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v1}, Lcom/kt/olleh/inapp/Purchase;->access$10(Lcom/kt/olleh/inapp/Purchase;)Lcom/kt/olleh/inapp/OnInAppListener;

    move-result-object v1

    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase$11;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v2}, Lcom/kt/olleh/inapp/Purchase;->access$16(Lcom/kt/olleh/inapp/Purchase;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/kt/olleh/inapp/OnInAppListener;->OnResultPurchase(Ljava/lang/String;)V

    goto :goto_0

    .line 469
    :pswitch_2
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase$11;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v1}, Lcom/kt/olleh/inapp/Purchase;->userCancelResponse()V

    goto :goto_0

    .line 457
    :pswitch_data_0
    .packed-switch 0x3f3
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
