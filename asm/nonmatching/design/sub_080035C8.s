	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080035C8
sub_080035C8: @ 0x080035C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _08003634 @ =gUnknown_0808D774
	mov r0, sp
	movs r2, #8
	bl sub_0808B6E8
	movs r0, #0xf
	mov r8, r0
	movs r6, #0
	ldr r1, _08003638 @ =gUnknown_08485CC8
	mov sl, r1
	mov r7, sp
	ldr r0, _0800363C @ =0x000001FF
	mov sb, r0
_080035EE:
	ldrh r0, [r7]
	adds r7, #2
	mov r4, r8
	adds r4, #1
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r4, r1
	adds r6, #1
	lsls r1, r6, #2
	add r1, sl
	ldr r5, [r1]
	bl sub_08001D04
	adds r3, r0, #0
	lsls r3, r3, #0xc
	movs r0, #0x17
	mov r1, sb
	ands r0, r1
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_0801BD00
	movs r0, #0x11
	add r8, r0
	cmp r6, #3
	ble _080035EE
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003634: .4byte gUnknown_0808D774
_08003638: .4byte gUnknown_08485CC8
_0800363C: .4byte 0x000001FF

