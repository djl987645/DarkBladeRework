.class Lcom/beyond/BeyondActivity$1;
.super Landroid/os/Handler;
.source "BeyondActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/beyond/BeyondActivity;->CreateHandler()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/beyond/BeyondActivity;


# direct methods
.method constructor <init>(Lcom/beyond/BeyondActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/beyond/BeyondActivity$1;->this$0:Lcom/beyond/BeyondActivity;

    .line 605
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 608
    iget v2, p1, Landroid/os/Message;->what:I

    sparse-switch v2, :sswitch_data_0

    .line 690
    :cond_0
    :goto_0
    :sswitch_0
    return-void

    .line 611
    :sswitch_1
    iget-object v3, p0, Lcom/beyond/BeyondActivity$1;->this$0:Lcom/beyond/BeyondActivity;

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Lcom/beyond/util/MessageInfo;

    invoke-virtual {v3, v2}, Lcom/beyond/BeyondActivity;->onMessage(Lcom/beyond/util/MessageInfo;)V

    goto :goto_0

    .line 614
    :sswitch_2
    sget-object v2, Lcom/beyond/BeyondActivity;->jf:Lcom/beyond/InputBox;

    if-eqz v2, :cond_0

    .line 615
    sget-object v3, Lcom/beyond/BeyondActivity;->jf:Lcom/beyond/InputBox;

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Lcom/beyond/InputBox;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 618
    :sswitch_3
    sget-object v2, Lcom/beyond/BeyondActivity;->jf:Lcom/beyond/InputBox;

    if-eqz v2, :cond_0

    .line 619
    sget-object v2, Lcom/beyond/BeyondActivity;->jf:Lcom/beyond/InputBox;

    iget v3, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v2, v3}, Lcom/beyond/InputBox;->setSelection(I)V

    goto :goto_0

    .line 622
    :sswitch_4
    sget-object v2, Lcom/beyond/BeyondActivity;->jf:Lcom/beyond/InputBox;

    if-eqz v2, :cond_0

    .line 623
    iget-object v2, p0, Lcom/beyond/BeyondActivity$1;->this$0:Lcom/beyond/BeyondActivity;

    const-string v3, "input_method"

    invoke-virtual {v2, v3}, Lcom/beyond/BeyondActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 624
    .local v1, "imm":Landroid/view/inputmethod/InputMethodManager;
    sget-object v2, Lcom/beyond/BeyondActivity;->jf:Lcom/beyond/InputBox;

    invoke-virtual {v1, v2, v4}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    goto :goto_0

    .line 628
    .end local v1    # "imm":Landroid/view/inputmethod/InputMethodManager;
    :sswitch_5
    invoke-static {v4}, Ljava/lang/System;->exit(I)V

    goto :goto_0

    .line 631
    :sswitch_6
    iget-object v3, p0, Lcom/beyond/BeyondActivity$1;->this$0:Lcom/beyond/BeyondActivity;

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Rect;

    invoke-virtual {v3, v5, v2}, Lcom/beyond/BeyondActivity;->onRequestAdView(ZLandroid/graphics/Rect;)V

    goto :goto_0

    .line 634
    :sswitch_7
    iget-object v2, p0, Lcom/beyond/BeyondActivity$1;->this$0:Lcom/beyond/BeyondActivity;

    const/4 v3, 0x0

    invoke-virtual {v2, v4, v3}, Lcom/beyond/BeyondActivity;->onRequestAdView(ZLandroid/graphics/Rect;)V

    goto :goto_0

    .line 637
    :sswitch_8
    iget-object v2, p0, Lcom/beyond/BeyondActivity$1;->this$0:Lcom/beyond/BeyondActivity;

    invoke-virtual {v2, v5}, Lcom/beyond/BeyondActivity;->onShowAdView(Z)V

    goto :goto_0

    .line 640
    :sswitch_9
    iget-object v2, p0, Lcom/beyond/BeyondActivity$1;->this$0:Lcom/beyond/BeyondActivity;

    invoke-virtual {v2, v4}, Lcom/beyond/BeyondActivity;->onShowAdView(Z)V

    goto :goto_0

    .line 644
    :sswitch_a
    iget-object v2, p0, Lcom/beyond/BeyondActivity$1;->this$0:Lcom/beyond/BeyondActivity;

    invoke-virtual {v2}, Lcom/beyond/BeyondActivity;->onShowAnnun()V

    goto :goto_0

    .line 648
    :sswitch_b
    iget-object v2, p0, Lcom/beyond/BeyondActivity$1;->this$0:Lcom/beyond/BeyondActivity;

    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Lcom/beyond/BeyondActivity;->onShowDialog(Ljava/lang/Object;)V

    goto :goto_0

    .line 652
    :sswitch_c
    iget-object v2, p0, Lcom/beyond/BeyondActivity$1;->this$0:Lcom/beyond/BeyondActivity;

    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Lcom/beyond/BeyondActivity;->onRetryKafInit(Ljava/lang/Object;)V

    goto :goto_0

    .line 655
    :sswitch_d
    iget-object v2, p0, Lcom/beyond/BeyondActivity$1;->this$0:Lcom/beyond/BeyondActivity;

    invoke-virtual {v2}, Lcom/beyond/BeyondActivity;->appStart()V

    goto :goto_0

    .line 673
    :sswitch_e
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 674
    .local v0, "_as":Ljava/lang/String;
    iget-object v2, p0, Lcom/beyond/BeyondActivity$1;->this$0:Lcom/beyond/BeyondActivity;

    invoke-virtual {v2, v0}, Lcom/beyond/BeyondActivity;->purchase(Ljava/lang/String;)V

    goto :goto_0

    .line 687
    .end local v0    # "_as":Ljava/lang/String;
    :sswitch_f
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/beyond/BeyondActivity;->ShowToast(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 608
    :sswitch_data_0
    .sparse-switch
        0x65 -> :sswitch_2
        0x66 -> :sswitch_3
        0x67 -> :sswitch_4
        0x78 -> :sswitch_a
        0xc8 -> :sswitch_6
        0xc9 -> :sswitch_7
        0xd2 -> :sswitch_8
        0xd3 -> :sswitch_9
        0xdc -> :sswitch_b
        0x12c -> :sswitch_1
        0x1bc -> :sswitch_5
        0x1bd -> :sswitch_c
        0x1f5 -> :sswitch_d
        0x1f6 -> :sswitch_e
        0x3e6 -> :sswitch_f
        0x3e7 -> :sswitch_0
    .end sparse-switch
.end method
