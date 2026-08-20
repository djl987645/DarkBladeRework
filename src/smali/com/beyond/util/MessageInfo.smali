.class public Lcom/beyond/util/MessageInfo;
.super Ljava/lang/Object;
.source "MessageInfo.java"


# static fields
.field public static final MIC_WEBVIEW:I = 0x0

.field public static final MISC_CREATE:I = 0x0

.field public static final MISC_HIDE:I = 0x3

.field public static final MISC_REMOVE:I = 0x1

.field public static final MISC_SHOW:I = 0x2


# instance fields
.field public command:I

.field public rc:Landroid/graphics/Rect;

.field public stringValue:Ljava/lang/String;

.field public subCommand:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput v0, p0, Lcom/beyond/util/MessageInfo;->command:I

    .line 18
    iput v0, p0, Lcom/beyond/util/MessageInfo;->subCommand:I

    .line 19
    iput-object v1, p0, Lcom/beyond/util/MessageInfo;->stringValue:Ljava/lang/String;

    .line 20
    iput-object v1, p0, Lcom/beyond/util/MessageInfo;->rc:Landroid/graphics/Rect;

    .line 9
    return-void
.end method
