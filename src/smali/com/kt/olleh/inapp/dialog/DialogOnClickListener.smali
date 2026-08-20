.class public Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;
.super Ljava/lang/Object;
.source "DialogOnClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mDialog:Landroid/app/Dialog;


# direct methods
.method public constructor <init>(Landroid/app/Dialog;)V
    .locals 0
    .param p1, "dialog"    # Landroid/app/Dialog;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;->mDialog:Landroid/app/Dialog;

    .line 19
    return-void
.end method


# virtual methods
.method public getDialog()Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;->mDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 24
    iget-object v0, p0, Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 25
    :cond_0
    return-void
.end method
