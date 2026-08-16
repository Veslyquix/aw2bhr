	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049BEC
sub_08049BEC: @ 0x08049BEC
	push {r4, r5, lr}
	mov ip, r0
	ldr r2, _08049C30 @ =gUnknown_02028E3D
	ldrb r0, [r2]
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1, #0x22]
	movs r5, #0x22
	ldrsh r0, [r1, r5]
	lsls r0, r0, #5
	adds r0, #0x38
	strh r0, [r1, #0x1e]
	ldr r0, _08049C34 @ =gUnknown_084C3240
	ldr r1, [r0]
	movs r0, #0x40
	strh r0, [r1, #0x20]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	mov r2, ip
	adds r2, #0x26
	movs r0, #0x50
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x28
	strb r3, [r0]
	adds r1, #0x2a
	strb r3, [r1]
	mov r0, ip
	strh r4, [r0, #0x24]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049C30: .4byte gUnknown_02028E3D
_08049C34: .4byte gUnknown_084C3240

