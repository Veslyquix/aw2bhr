	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074B60
sub_08074B60: @ 0x08074B60
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, [r6, #0x3c]
	cmp r2, #0
	bne _08074B80
	ldr r0, _08074B7C @ =gUnknown_0202FDFC
	ldrh r1, [r0]
	strh r1, [r6, #0x2c]
	ldrh r0, [r0, #2]
	strh r0, [r6, #0x2e]
	adds r0, r6, #0
	bl Proc_End
	b _08074BCE
	.align 2, 0
_08074B7C: .4byte gUnknown_0202FDFC
_08074B80:
	ldr r0, _08074BD4 @ =gUnknown_0202FEF8
	adds r0, r2, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r6, #0x3a]
	subs r0, r0, r1
	strh r0, [r6, #0x3a]
	subs r0, r2, #1
	str r0, [r6, #0x3c]
	ldr r5, _08074BD8 @ =gUnknown_0202FDFC
	ldrh r0, [r6, #0x30]
	ldrh r4, [r6, #0x2c]
	subs r0, r0, r4
	movs r2, #0x3a
	ldrsh r1, [r6, r2]
	muls r0, r1, r0
	movs r2, #0x38
	ldrsh r1, [r6, r2]
	bl __divsi3
	adds r4, r4, r0
	strh r4, [r5]
	ldrh r0, [r6, #0x32]
	ldrh r4, [r6, #0x2e]
	subs r0, r0, r4
	movs r2, #0x3a
	ldrsh r1, [r6, r2]
	muls r0, r1, r0
	movs r2, #0x38
	ldrsh r1, [r6, r2]
	bl __divsi3
	adds r4, r4, r0
	strh r4, [r5, #2]
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #3
	bl sub_08072C40
_08074BCE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08074BD4: .4byte gUnknown_0202FEF8
_08074BD8: .4byte gUnknown_0202FDFC

