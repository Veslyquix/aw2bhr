	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08002FE4
sub_08002FE4: @ 0x08002FE4
	push {r4, r5, lr}
	sub sp, #4
	ldr r1, _08003034 @ =gUnknown_0808D750
	mov r0, sp
	movs r2, #4
	bl sub_0808B6E8
	movs r0, #9
	movs r1, #2
	movs r2, #0xb
	movs r3, #0x11
	bl sub_0801A444
	movs r0, #2
	bl sub_08013AD4
	movs r4, #0
	ldr r5, _08003038 @ =gUnknown_08485C9C
_08003008:
	mov r1, sp
	adds r0, r1, r4
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	adds r4, #1
	lsls r1, r4, #2
	adds r1, r1, r5
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, _0800303C @ =0x06010000
	adds r2, r2, r1
	movs r1, #0
	movs r3, #1
	bl sub_0803F6BC
	cmp r4, #3
	ble _08003008
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003034: .4byte gUnknown_0808D750
_08003038: .4byte gUnknown_08485C9C
_0800303C: .4byte 0x06010000

