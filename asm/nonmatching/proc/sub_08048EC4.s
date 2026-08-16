	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08048EC4
sub_08048EC4: @ 0x08048EC4
	push {r4, lr}
	ldr r2, _08048EE4 @ =gUnknown_0812A150
	ldr r0, [r2]
	ldr r0, [r0]
	ldr r1, _08048EE8 @ =0x00000832
	adds r3, r0, r1
	ldrh r4, [r3]
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #0x38
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08048EEC
	adds r0, r4, #0
	subs r0, #8
	b _08048EEE
	.align 2, 0
_08048EE4: .4byte gUnknown_0812A150
_08048EE8: .4byte 0x00000832
_08048EEC:
	ldr r0, _08048F08 @ =0x0000FFC8
_08048EEE:
	strh r0, [r3]
	ldr r0, [r2]
	ldr r0, [r0]
	ldr r1, _08048F0C @ =0x00000832
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0x38
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08048F08: .4byte 0x0000FFC8
_08048F0C: .4byte 0x00000832

