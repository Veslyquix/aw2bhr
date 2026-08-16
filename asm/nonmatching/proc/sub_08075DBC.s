	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075DBC
sub_08075DBC: @ 0x08075DBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	bne _08075DCC
	adds r0, r4, #0
	bl Proc_End
_08075DCC:
	ldr r1, _08075E08 @ =gUnknown_081D1504
	adds r0, r4, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #6
	lsls r0, r0, #5
	adds r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_080135F4
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	bl sub_080136C4
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0xf
	bl sub_08075A54
	bl sub_080135A4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075E08: .4byte gUnknown_081D1504

