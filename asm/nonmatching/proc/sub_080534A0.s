	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080534A0
sub_080534A0: @ 0x080534A0
	push {r4, r5, r6, lr}
	ldr r0, _08053504 @ =gUnknown_0300450C
	ldrh r5, [r0]
	ldr r6, _08053508 @ =gUnknown_03004544
	ldr r1, _0805350C @ =gUnknown_030045A4
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r6]
	ldrh r0, [r0]
	cmp r1, r0
	blo _080534F0
	ldr r3, _08053510 @ =gUnknown_085643B0
	ldr r4, _08053514 @ =gUnknown_03004530
	ldrh r0, [r4]
	movs r2, #1
	ands r2, r0
	lsls r2, r2, #1
	ldr r0, _08053518 @ =gUnknown_03004520
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, _0805351C @ =gUnknown_03004580
	lsls r1, r5, #4
	adds r0, #6
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r2, r2, r3
	movs r1, #0
	ldrsh r0, [r2, r1]
	bl sub_0803B48C
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #0
	strh r0, [r6]
_080534F0:
	movs r0, #0
	bl sub_08053520
	movs r0, #1
	bl sub_08053520
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053504: .4byte gUnknown_0300450C
_08053508: .4byte gUnknown_03004544
_0805350C: .4byte gUnknown_030045A4
_08053510: .4byte gUnknown_085643B0
_08053514: .4byte gUnknown_03004530
_08053518: .4byte gUnknown_03004520
_0805351C: .4byte gUnknown_03004580

