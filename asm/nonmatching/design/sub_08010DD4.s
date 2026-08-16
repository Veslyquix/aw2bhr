	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08010DD4
sub_08010DD4: @ 0x08010DD4
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r6, r1, #0
	ldr r2, _08010E38 @ =gUnknown_0808D8A8
	ldr r0, [r2]
	ldr r1, [r0]
	lsls r0, r6, #1
	ldr r4, _08010E3C @ =0x0000417A
	adds r4, r4, r1
	mov ip, r4
	add r0, ip
	ldrh r5, [r0]
	adds r0, r5, r3
	lsls r0, r0, #1
	ldr r7, _08010E40 @ =0x00000A22
	adds r4, r1, r7
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, #0xa1
	lsls r0, r0, #1
	cmp r1, r0
	bne _08010E48
	subs r0, r3, #1
	cmp r0, #0
	blt _08010E1E
	subs r1, r5, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r4, r1
	ldr r4, _08010E44 @ =0xFFFFFE9E
	adds r0, r4, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _08010EA0
_08010E1E:
	adds r1, r3, #1
	ldr r0, [r2]
	ldr r2, [r0]
	ldrh r7, [r2]
	cmp r1, r7
	bge _08010EB4
	lsls r1, r6, #1
	ldr r4, _08010E3C @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #1
	b _08010E86
	.align 2, 0
_08010E38: .4byte gUnknown_0808D8A8
_08010E3C: .4byte 0x0000417A
_08010E40: .4byte 0x00000A22
_08010E44: .4byte 0xFFFFFE9E
_08010E48:
	ldr r0, _08010EA4 @ =0x00000143
	cmp r1, r0
	bne _08010EA0
	subs r0, r6, #1
	cmp r0, #0
	blt _08010E70
	lsls r0, r0, #1
	add r0, ip
	ldrh r1, [r0]
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r4, r1
	ldr r4, _08010EA8 @ =0xFFFFFE9E
	adds r0, r4, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _08010EA0
_08010E70:
	adds r1, r6, #1
	ldr r0, [r2]
	ldr r2, [r0]
	ldrh r7, [r2, #2]
	cmp r1, r7
	bge _08010EB4
	lsls r1, r1, #1
	ldr r4, _08010EAC @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r0, [r0]
_08010E86:
	adds r0, r0, r3
	lsls r0, r0, #1
	ldr r7, _08010EB0 @ =0x00000A22
	adds r1, r2, r7
	adds r1, r1, r0
	ldr r2, _08010EA8 @ =0xFFFFFE9E
	adds r0, r2, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08010EB4
_08010EA0:
	movs r0, #1
	b _08010EB6
	.align 2, 0
_08010EA4: .4byte 0x00000143
_08010EA8: .4byte 0xFFFFFE9E
_08010EAC: .4byte 0x0000417A
_08010EB0: .4byte 0x00000A22
_08010EB4:
	movs r0, #0
_08010EB6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

