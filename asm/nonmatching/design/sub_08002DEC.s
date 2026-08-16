	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08002DEC
sub_08002DEC: @ 0x08002DEC
	push {lr}
	movs r0, #3
	movs r1, #0
	bl sub_0802A8AC
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	movs r0, #0xf
	movs r1, #0
	bl sub_0802A8AC
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	movs r0, #1
	movs r1, #0
	bl sub_0802A8AC
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	movs r0, #5
	movs r1, #0
	bl sub_0802A8AC
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	pop {r0}
	bx r0
	.align 2, 0

