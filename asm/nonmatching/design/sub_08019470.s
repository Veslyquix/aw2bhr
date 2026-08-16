	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019470
sub_08019470: @ 0x08019470
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl sub_08017988
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bne _080194EE
	ldr r1, _080194F8 @ =gUnknown_0808E5A4
	ldr r0, [r1]
	strh r2, [r0]
	movs r2, #0
	mov r8, r1
	ldr r6, _080194FC @ =gUnknown_0200C528
	adds r7, r6, #0
	adds r7, #8
_08019492:
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r2, r1, #3
	adds r3, r2, r6
	ldr r1, [r3]
	adds r5, r0, #0
	cmp r1, #0
	beq _080194BA
	adds r0, r2, r7
	ldr r1, [r0]
	cmp r1, #0
	beq _080194B4
	adds r0, r3, #0
	bl _call_via_r1
_080194B4:
	adds r0, r4, #0
	bl sub_08019404
_080194BA:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r5, r1
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08019492
	ldr r0, _08019500 @ =gUnknown_03001404
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _080194EE
	ldr r0, _08019504 @ =gUnknown_03002EE0
	ldr r1, [r0]
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r0, [r1]
	strh r0, [r1, #6]
	ldr r0, _08019508 @ =gUnknown_03004538
	strh r2, [r0]
	ldr r0, _0801950C @ =gUnknown_03004518
	strh r2, [r0]
_080194EE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080194F8: .4byte gUnknown_0808E5A4
_080194FC: .4byte gUnknown_0200C528
_08019500: .4byte gUnknown_03001404
_08019504: .4byte gUnknown_03002EE0
_08019508: .4byte gUnknown_03004538
_0801950C: .4byte gUnknown_03004518

