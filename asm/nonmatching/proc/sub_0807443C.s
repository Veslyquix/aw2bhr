	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807443C
sub_0807443C: @ 0x0807443C
	push {lr}
	bl sub_08074584
	cmp r0, #0
	beq _0807445A
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _0807445A
	movs r1, #0
	movs r2, #0
	bl sub_08074484
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0807445C
_0807445A:
	movs r0, #0
_0807445C:
	pop {r1}
	bx r1

