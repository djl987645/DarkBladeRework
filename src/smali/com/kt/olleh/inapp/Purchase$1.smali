.class Lcom/kt/olleh/inapp/Purchase$1;
.super Landroid/os/Handler;
.source "Purchase.java"


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
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase$1;->this$0:Lcom/kt/olleh/inapp/Purchase;

    .line 590
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 595
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 632
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 598
    :pswitch_1
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$1;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v0}, Lcom/kt/olleh/inapp/Purchase;->LoginDialog()V

    goto :goto_0

    .line 602
    :pswitch_2
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$1;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v0}, Lcom/kt/olleh/inapp/Purchase;->AlertDialog()V

    goto :goto_0

    .line 610
    :pswitch_3
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$1;->this$0:Lcom/kt/olleh/inapp/Purchase;

    sget v1, Lcom/kt/olleh/inapp/Purchase;->Pay_Alert_Mode:I

    invoke-virtual {v0, v1}, Lcom/kt/olleh/inapp/Purchase;->PayDialog(I)V

    goto :goto_0

    .line 614
    :pswitch_4
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$1;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v0}, Lcom/kt/olleh/inapp/Purchase;->LodingDialog()V

    goto :goto_0

    .line 618
    :pswitch_5
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$1;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v0}, Lcom/kt/olleh/inapp/Purchase;->SelectDialog()V

    goto :goto_0

    .line 622
    :pswitch_6
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$1;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v0}, Lcom/kt/olleh/inapp/Purchase;->access$0(Lcom/kt/olleh/inapp/Purchase;)Lcom/kt/olleh/inapp/dialog/DialogProgress;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 624
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$1;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-static {v0}, Lcom/kt/olleh/inapp/Purchase;->access$0(Lcom/kt/olleh/inapp/Purchase;)Lcom/kt/olleh/inapp/dialog/DialogProgress;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kt/olleh/inapp/dialog/DialogProgress;->dismiss()V

    .line 625
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase$1;->this$0:Lcom/kt/olleh/inapp/Purchase;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/kt/olleh/inapp/Purchase;->access$1(Lcom/kt/olleh/inapp/Purchase;Lcom/kt/olleh/inapp/dialog/DialogProgress;)V

    goto :goto_0

    .line 595
    :pswitch_data_0
    .packed-switch 0x3e8
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_6
        :pswitch_1
        :pswitch_5
    .end packed-switch
.end method
