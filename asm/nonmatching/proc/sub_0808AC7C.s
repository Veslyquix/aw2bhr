	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808AC7C
sub_0808AC7C: @ 0x0808AC7C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0808AD00 @ =gUnknown_03000F68
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, [r1]
	adds r2, r2, r0
	ldr r1, _0808AD04 @ =gUnknown_03000F7C
	ldr r0, _0808AD08 @ =0x04000208
	mov sb, r0
	ldrh r0, [r0]
	strh r0, [r1]
	movs r3, #0
	mov r1, sb
	strh r3, [r1]
	ldr r0, _0808AD0C @ =gUnknown_03000F78
	mov r8, r0
	ldr r4, [r0]
	strh r3, [r4, #2]
	ldr r6, _0808AD10 @ =0x04000200
	ldr r1, _0808AD14 @ =gUnknown_03000F70
	mov sl, r1
	ldrb r1, [r1]
	movs r5, #8
	adds r0, r5, #0
	lsls r0, r1
	adds r1, r0, #0
	ldrh r0, [r6]
	orrs r0, r1
	strh r0, [r6]
	ldr r0, _0808AD18 @ =gUnknown_03000F74
	strb r3, [r0]
	ldr r1, _0808AD1C @ =gUnknown_03000F72
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	ldrh r0, [r2]
	strh r0, [r4]
	adds r0, r4, #2
	mov r1, r8
	str r0, [r1]
	ldrh r0, [r2, #2]
	strh r0, [r4, #2]
	str r4, [r1]
	ldr r1, _0808AD20 @ =0x04000202
	mov r2, sl
	ldrb r0, [r2]
	lsls r5, r0
	strh r5, [r1]
	movs r0, #1
	mov r3, sb
	strh r0, [r3]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808AD00: .4byte gUnknown_03000F68
_0808AD04: .4byte gUnknown_03000F7C
_0808AD08: .4byte 0x04000208
_0808AD0C: .4byte gUnknown_03000F78
_0808AD10: .4byte 0x04000200
_0808AD14: .4byte gUnknown_03000F70
_0808AD18: .4byte gUnknown_03000F74
_0808AD1C: .4byte gUnknown_03000F72
_0808AD20: .4byte 0x04000202

