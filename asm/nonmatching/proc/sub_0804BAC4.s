	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804BAC4
sub_0804BAC4: @ 0x0804BAC4
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r0, r2, #0
	cmp r3, #0
	beq _0804BAFC
	movs r3, #0
	movs r2, #0
	ldr r5, _0804BAD8 @ =gUnknown_08136040
	lsrs r4, r0, #2
	b _0804BADE
	.align 2, 0
_0804BAD8: .4byte gUnknown_08136040
_0804BADC:
	adds r2, #1
_0804BADE:
	cmp r2, #0x2c
	bgt _0804BB0A
	movs r0, #0xe
_0804BAE4:
	subs r0, #1
	adds r3, #1
	cmp r0, #0
	bge _0804BAE4
	adds r3, #0x11
	adds r1, r3, #0
	adds r1, #0xf
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	ble _0804BADC
	b _0804BB0A
_0804BAFC:
	ldr r5, _0804BB20 @ =gUnknown_08136040
	lsrs r4, r0, #2
	movs r2, #0x80
	lsls r2, r2, #4
_0804BB04:
	subs r2, #1
	cmp r2, #0
	bne _0804BB04
_0804BB0A:
	ldr r0, [r5]
	ldr r0, [r0]
	ldr r1, _0804BB24 @ =0x001FFFFF
	ands r4, r1
	adds r1, r6, #0
	adds r2, r4, #0
	bl CpuFastSet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804BB20: .4byte gUnknown_08136040
_0804BB24: .4byte 0x001FFFFF

