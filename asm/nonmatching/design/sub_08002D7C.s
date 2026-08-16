	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08002D7C
sub_08002D7C: @ 0x08002D7C
	push {r4, lr}
	bl sub_0801F114
	ldr r4, _08002DE8 @ =0x06010000
	movs r2, #0xc7
	lsls r2, r2, #2
	movs r0, #1
	adds r1, r4, #0
	movs r3, #0x14
	bl sub_0801F150
	movs r0, #0x3e
	bl sub_0801F234
	movs r0, #0x3f
	bl sub_0801F234
	movs r0, #0x40
	bl sub_0801F234
	movs r0, #0x41
	bl sub_0801F234
	movs r2, #0xcb
	lsls r2, r2, #2
	movs r0, #2
	adds r1, r4, #0
	movs r3, #0x1d
	bl sub_0801F150
	movs r0, #0x54
	bl sub_0801F234
	movs r0, #0x90
	bl sub_0801F234
	movs r0, #0x91
	bl sub_0801F234
	movs r0, #0x8e
	bl sub_0801F234
	movs r0, #0x8f
	bl sub_0801F234
	movs r0, #0xaa
	bl sub_0801F234
	bl sub_08002EF8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002DE8: .4byte 0x06010000

