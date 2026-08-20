.class public Lcom/beyond/DialogInfo;
.super Ljava/lang/Object;
.source "DialogInfo.java"


# instance fields
.field public content:Ljava/lang/String;

.field public isAppPause:Z

.field public listener:Landroid/content/DialogInterface$OnClickListener;

.field public title:Ljava/lang/String;

.field public type:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const-string v0, "Info"

    iput-object v0, p0, Lcom/beyond/DialogInfo;->title:Ljava/lang/String;

    .line 13
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/DialogInfo;->isAppPause:Z

    .line 9
    return-void
.end method
