	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08084938
sub_08084938: @ 0x08084938
	push {r4, lr}
	movs r4, #1
_0808493C:
	adds r0, r4, #0
	bl sub_0803CB24
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808495C
	adds r4, #1
	cmp r4, #0x6b
	ble _0808493C
	movs r4, #0x6c
_08084950:
	adds r0, r4, #0
	bl sub_0803CB24
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08084960
_0808495C:
	movs r0, #0
	b _08084968
_08084960:
	adds r4, #1
	cmp r4, #0x89
	ble _08084950
	movs r0, #1
_08084968:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

