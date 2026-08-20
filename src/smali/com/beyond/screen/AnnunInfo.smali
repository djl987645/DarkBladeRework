.class public Lcom/beyond/screen/AnnunInfo;
.super Ljava/lang/Object;
.source "AnnunInfo.java"


# instance fields
.field public bg:I

.field public height:I

.field public img_path:Ljava/lang/String;

.field public img_rc:Landroid/graphics/Rect;

.field public isShow:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput v1, p0, Lcom/beyond/screen/AnnunInfo;->height:I

    .line 9
    iput-object v2, p0, Lcom/beyond/screen/AnnunInfo;->img_path:Ljava/lang/String;

    .line 10
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/beyond/screen/AnnunInfo;->bg:I

    .line 11
    iput-boolean v1, p0, Lcom/beyond/screen/AnnunInfo;->isShow:Z

    .line 12
    iput-object v2, p0, Lcom/beyond/screen/AnnunInfo;->img_rc:Landroid/graphics/Rect;

    .line 7
    return-void
.end method
