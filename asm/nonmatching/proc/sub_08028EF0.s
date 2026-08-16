	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028EF0
sub_08028EF0: @ 0x08028EF0
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _08028F7C @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r0, [r2, #4]
	strh r0, [r3, #0x1e]
	ldrh r0, [r2, #6]
	strh r0, [r3, #0x20]
	ldrh r0, [r3, #0x22]
	ldrh r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r3, #0x26]
	ldrh r0, [r3, #0x24]
	ldrh r1, [r2, #6]
	subs r0, r0, r1
	strh r0, [r3, #0x28]
	movs r0, #0x26
	ldrsh r1, [r3, r0]
	adds r4, r1, #0
	cmp r1, #0
	bge _08028F1C
	rsbs r4, r1, #0
_08028F1C:
	movs r2, #0x28
	ldrsh r0, [r3, r2]
	adds r2, r0, #0
	cmp r0, #0
	bge _08028F28
	rsbs r2, r0, #0
_08028F28:
	cmp r4, r2
	ble _08028F2E
	adds r0, r1, #0
_08028F2E:
	cmp r0, #0
	bge _08028F34
	rsbs r0, r0, #0
_08028F34:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #1
	movs r0, #0
	strh r0, [r3, #0x2a]
	subs r0, r2, #1
	ldr r5, _08028F80 @ =gUnknown_08090B58
	cmp r0, #0
	blt _08028F6A
	ldr r4, [r5]
_08028F48:
	subs r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r3, #0x2a]
	adds r0, r0, r4
	strb r1, [r0]
	cmp r1, #7
	bhi _08028F5E
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08028F5E:
	ldrh r0, [r3, #0x2a]
	adds r0, #1
	strh r0, [r3, #0x2a]
	subs r0, r2, r1
	cmp r0, #0
	bge _08028F48
_08028F6A:
	ldr r0, [r5]
	ldrh r1, [r3, #0x2a]
	adds r1, r1, r0
	movs r0, #0
	strb r2, [r1]
	strh r0, [r3, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028F7C: .4byte gUnknown_08499590
_08028F80: .4byte gUnknown_08090B58

