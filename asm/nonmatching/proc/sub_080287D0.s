	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080287D0
sub_080287D0: @ 0x080287D0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _080287E2
	cmp r0, #0x10
	bne _080287EA
_080287E2:
	adds r0, r4, #0
	bl Proc_Break
	b _08028842
_080287EA:
	ldr r0, _08028830 @ =gUnknown_0849A198
	bl Proc_Find
	cmp r0, #0
	bne _08028842
	adds r5, r4, #0
	adds r5, #0x68
	ldrh r6, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0x32
	bgt _0802883C
	ldr r3, _08028834 @ =gUnknown_08499594
	ldr r2, _08028838 @ =gUnknown_084995FE
	adds r0, r4, #0
	adds r0, #0x64
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r5, r2]
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r3]
	adds r0, r0, r1
	adds r1, r6, #1
	strh r1, [r5]
	adds r1, r4, #0
	bl sub_0802A54C
	b _08028842
	.align 2, 0
_08028830: .4byte gUnknown_0849A198
_08028834: .4byte gUnknown_08499594
_08028838: .4byte gUnknown_084995FE
_0802883C:
	adds r0, r4, #0
	bl Proc_Break
_08028842:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

