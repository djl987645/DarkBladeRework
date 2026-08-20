.class Lcom/kt/olleh/inapp/Purchase$7;
.super Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;
.source "Purchase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/kt/olleh/inapp/Purchase;->AlertDialog()V
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
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase$7;->this$0:Lcom/kt/olleh/inapp/Purchase;

    .line 256
    invoke-direct {p0, p2}, Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;-><init>(Landroid/app/Dialog;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 260
    invoke-super {p0, p1}, Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;->onClick(Landroid/view/View;)V

    .line 261
    return-void
.end method
