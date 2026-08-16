	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080295E4
sub_080295E4: @ 0x080295E4
	push {r4, r5, r6, lr}
	ldr r1, _08029658 @ =gUnknown_03003100
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	ldr r2, _0802965C @ =gUnknown_030040D8
	ldr r4, [r2]
	ldr r6, _08029660 @ =gUnknown_03001470
	ldr r5, _08029664 @ =gUnknown_03001FBC
	movs r2, #0
	ldrsh r3, [r5, r2]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #5
	adds r2, r2, r6
	movs r3, #0x22
	ldrsh r2, [r2, r3]
	adds r4, #7
	adds r4, r4, r2
	ldrb r2, [r4]
	bl sub_08041F38
	movs r1, #0
	ldrsh r2, [r5, r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #5
	adds r1, r1, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	strh r0, [r1, #0x1e]
	movs r3, #0
	ldrsh r1, [r5, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r6
	movs r1, #3
	strh r1, [r0, #0x20]
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r6
	strh r2, [r0, #0x24]
	ldr r0, _08029668 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802964E
	bl sub_0803446C
_0802964E:
	bl sub_080294FC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08029658: .4byte gUnknown_03003100
_0802965C: .4byte gUnknown_030040D8
_08029660: .4byte gUnknown_03001470
_08029664: .4byte gUnknown_03001FBC
_08029668: .4byte gUnknown_03003FC0

