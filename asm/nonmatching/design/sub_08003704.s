	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003704
sub_08003704: @ 0x08003704
	push {lr}
	ldr r1, _08003764 @ =0x06010000
	ldr r2, _08003768 @ =0x0000028D
	movs r0, #0
	movs r3, #0x1d
	bl sub_0801F150
	movs r0, #2
	bl sub_0801F234
	movs r0, #0xc
	bl sub_0801F234
	movs r0, #0x2f
	bl sub_0801F234
	movs r0, #0x30
	bl sub_0801F234
	movs r0, #0x31
	bl sub_0801F234
	movs r0, #0x32
	bl sub_0801F234
	movs r0, #0x33
	bl sub_0801F234
	movs r0, #0x34
	bl sub_0801F234
	movs r0, #0x35
	bl sub_0801F234
	movs r0, #0x36
	bl sub_0801F234
	movs r0, #0x37
	bl sub_0801F234
	movs r0, #0x38
	bl sub_0801F234
	movs r0, #0x3c
	bl sub_0801F234
	pop {r0}
	bx r0
	.align 2, 0
_08003764: .4byte 0x06010000
_08003768: .4byte 0x0000028D

